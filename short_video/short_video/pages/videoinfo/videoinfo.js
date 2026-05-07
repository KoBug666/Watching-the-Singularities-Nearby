var videoUtil = require('../../utils/videoUtil.js')

const app = getApp()

Page({
  data: {
    cover: "cover",
    videoId: "",
    src: "",
    videoInfo: {},
    isMe: false,
    isfans: false,
    userLikeVideo: false,
    likeNum: 0,

    commentsPage: 1,
    commentsTotalPage:1,
    commentsList:[],
    
    playState: true,
    windowHeight: 0,

    placeholder: "说点什么..."
   

    
  },

  videoCtx: {},
  
    /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var that = this
    that.setData({
      windowHeight: wx.getSystemInfoSync().windowHeight
    })
  },
  onReady: function () {
    this.vvideo = wx.createVideoContext("kdvideo", this)
    this.animation = wx.createAnimation({
      duration: 500,// 整个动画过程花费的时间，单位为毫秒
      transformOrigin: '0 0 0'// 动画的类型
    })
    this.toast = this.selectComponent("#toast");
    // this.animationTwo = wx.createAnimation({ //评论组件弹出动画
    //   duration: 400, // 整个动画过程花费的时间，单位为毫秒
    //   timingFunction: "ease", // 动画的类型
    //   delay: 0 // 动画延迟参数
    // })
  },
  changePlayStatus() {
    console.log('changePlayStatus')
    let playState = !this.data.playState
    if (this.data.animationShow) {

    } else {
      if (playState) {
        this.vvideo.play()
      } else {
        this.vvideo.pause()
      }
      this.setData({
        playState: playState
      })
    }

  },
  

  onLoad: function (params) {    
    var me = this;
    me.videoCtx = wx.createVideoContext("myVideo", me);

    // 获取上一个页面传入的参数
    var videoInfo = JSON.parse(params.videoInfo);

    var height = videoInfo.videoHeight;
    var width = videoInfo.videoWidth;
    var cover = "cover";
    if (width >= height) {
      cover = "";
    }

    me.setData({
      videoId: videoInfo.id,
      src: app.serverUrl + videoInfo.videoPath,
      videoInfo: videoInfo,
      cover: cover
    });

    var serverUrl = app.serverUrl;
    var user = app.getGlobalUserInfo();
    var loginUserId = "";
    if (user != null && user != undefined && user != '') {
      loginUserId = user.id;
    }
    wx.request({
      url: serverUrl + '/user/queryPublisher?loginUserId=' + loginUserId + "&videoId=" + videoInfo.id + "&publishUserId=" + videoInfo.userId,
      method: 'POST',
      success: function(res) {
        console.log(res.data);

        var publisher = res.data.data.publisher;
        var userLikeVideo = res.data.data.userLikeVideo;
        if (publisher.id == user.id) {
          me.setData({
            isMe: true
          })
        } else {
          me.setData({
            isMe: false
          })
        }
        if (publisher.follow) {
          me.setData({
            isfans: true
          })
        }else{
          me.setData({
            isfans: false
          })
        }
        me.setData({
          serverUrl: serverUrl,
          publisher: publisher,
          userLikeVideo: userLikeVideo
        });
      }
    })

    me.getCommentsList(1);
  },

  onShow: function () {
    var me = this;
    me.videoCtx.play();
  },

  onHide: function () {
    var me = this;
    me.videoCtx.pause();
  },
  
  showSearch: function () {
    wx.redirectTo({
      url: '../searchVideo/searchVideo',
    })
  },

  showPublisher: function () {
    var me = this;

    var user = app.getGlobalUserInfo();

    var videoInfo = me.data.videoInfo;
    var realUrl = '../mine/mine#publisherId@' + videoInfo.userId;

    if (user == null || user == undefined || user == '') {
      wx.redirectTo({
        url: '../userLogin/login?redirectUrl=' + realUrl,
      })
    } else {
      wx.redirectTo({
        url: '../mine/mine?publisherId=' + videoInfo.userId,
      })
    }

  },


  upload: function () {
    var me = this;

    var user = app.getGlobalUserInfo();

    var videoInfo = JSON.stringify(me.data.videoInfo);
    var realUrl = '../videoinfo/videoinfo#videoInfo@' + videoInfo;

    if (user == null || user == undefined || user == '') {
      wx.navigateTo({
        url: '../userLogin/login?redirectUrl=' + realUrl,
      })
    } else {
      videoUtil.uploadVideo();
    }
  },

  showIndex: function () {
    wx.redirectTo({
      url: '../index/index',
    })
  },
//关注
  showFollow: function () {
  var me = this;
  var user = app.getGlobalUserInfo();
  this.setData({
    isonload: false
  })
  if (user == null || user == undefined || user == '') {
    
    wx.redirectTo({
      url: '../userLogin/login',
    })
  } else {
    wx.navigateTo({
      url: '../index/index?follow=yes&page=1',
    })
  }

},
  showMine: function () {
    var user = app.getGlobalUserInfo();

    if (user == null || user == undefined || user == '') {
      wx.redirectTo({
        url: '../userLogin/login',
      })
    } else {
      wx.redirectTo({
        url: '../mine/mine',
      })
    }
  },


  
  likeVideoOrNot: function () {
    var me = this;
    var videoInfo = me.data.videoInfo;
    var user = app.getGlobalUserInfo();

    if (user == null || user == undefined || user == '') {
      wx.navigateTo({
        url: '../userLogin/login',
      })
    } else {
      
      var userLikeVideo = me.data.userLikeVideo;
      var url = '/video/userLike?userId=' + user.id + '&videoId=' + videoInfo.id + '&videoCreaterId=' + videoInfo.userId;
      if (userLikeVideo) {
        url = '/video/userUnLike?userId=' + user.id + '&videoId=' + videoInfo.id + '&videoCreaterId=' + videoInfo.userId;
      }

      var serverUrl = app.serverUrl;
      wx.showLoading({
        title: '...',
      })
      wx.request({
        url: serverUrl + url,
        method: 'POST',
        header: {
          'content-type': 'application/json', // 默认值
          'headerUserId': user.id,
          'headerUserToken': user.userToken
        },
        success:function(res) {
         wx.hideLoading();
         var num = me.data.likeNum
         userLikeVideo ? num = num - 1 : num = num + 1
          me.setData({
            userLikeVideo: !userLikeVideo,
            likeNum: num
          });
        }
      })


    }
  },

  addFans: function() {

    var me = this;
    var user = app.getGlobalUserInfo();
    var userId = user.id;
    var publisherId = me.data.publisher.id;
    var url = '/user/beyourfans?userId=' + publisherId + '&fanId=' + userId;
    wx.request({
      url: app.serverUrl + url,
      method: 'POST',
      header: {
        'content-type': 'application/json', // 默认值
        'headerUserId': user.id,
        'headerUserToken': user.userToken
      },
      success: function() {
        console.log("已关注")
        me.setData({
          isfans: true
        })
      }
    })
  },
  deleteFans: function() {
    var me = this;
    var user = app.getGlobalUserInfo();
    var userId = user.id;
    var publisherId = me.data.publisher.id;
    var url = '/user/dontbeyourfans?userId=' + publisherId + '&fanId=' + userId;
    wx.request({
      url: app.serverUrl + url,
      method: 'POST',
      header: {
        'content-type': 'application/json', // 默认值
        'headerUserId': user.id,
        'headerUserToken': user.userToken
      },
      success: function() {
        console.log("取消关注")
        me.setData({
          isfans: false
        })
      }
    })
  },
  shareMe: function() {
    var me = this;
    var user = app.getGlobalUserInfo();

    wx.showActionSheet({
      itemList: ['下载到本地', '举报用户', '其它分享'],
      success: function(res) {
        console.log(res.tapIndex);
        if (res.tapIndex == 0) {
          // 下载
          wx.showLoading({
            title: '下载中...',
          })
          wx.downloadFile({
            url: app.serverUrl + me.data.videoInfo.videoPath,
            success: function (res) {
              // 只要服务器有响应数据，就会把响应内容写入文件并进入 success 回调，业务需要自行判断是否下载到了想要的内容
              if (res.statusCode === 200) {
                console.log(res.tempFilePath);

                wx.saveVideoToPhotosAlbum({
                  filePath: res.tempFilePath,
                  success:function(res) {
                    console.log(res.errMsg)
                    wx.hideLoading();
                  }
                })
              }
            }
          })
        } else if (res.tapIndex == 1) {
          // 举报
          var videoInfo = JSON.stringify(me.data.videoInfo);
          var realUrl = '../videoinfo/videoinfo#videoInfo@' + videoInfo;

          if (user == null || user == undefined || user == '') {
            wx.navigateTo({
              url: '../userLogin/login?redirectUrl=' + realUrl,
            })
          } else {
            var publishUserId = me.data.videoInfo.userId;
            var videoId = me.data.videoInfo.id;
            var currentUserId = user.id;
            wx.navigateTo({
              url: '../report/report?videoId=' + videoId + "&publishUserId=" + publishUserId
            })
          }
        } else{
          wx.showToast({
            title: '官方暂未开放...',
          })
        } 
      }
    })
  },

  onShareAppMessage: function (res) {
    
    var me = this;
    var videoInfo = me.data.videoInfo;

    return {
      title: '短视频内容分享',
      path: "pages/videoinfo/videoinfo?videoInfo=" + JSON.stringify(videoInfo)
    }
  },


  leaveComment: function() {
    this.setData({
      commentFocus: true
    });
  },

  replyFocus: function(e) {
    var fatherCommentId = e.currentTarget.dataset.fathercommentid;
    var toUserId = e.currentTarget.dataset.touserid;
    var toNickname = e.currentTarget.dataset.tonickname;
 
    this.setData({
      placeholder: "回复  " + toNickname,
      replyFatherCommentId: fatherCommentId,
      replyToUserId: toUserId,
      commentFocus: true
    });
  },

  saveComment:function(e) {
    var me = this;
    var content = e.detail.value;

    // 获取评论回复的fatherCommentId和toUserId
    var fatherCommentId = e.currentTarget.dataset.replyfathercommentid;
    var toUserId = e.currentTarget.dataset.replytouserid;

    var user = app.getGlobalUserInfo();
    var videoInfo = JSON.stringify(me.data.videoInfo);
    var realUrl = '../videoinfo/videoinfo#videoInfo@' + videoInfo;

    if (user == null || user == undefined || user == '') {
      wx.navigateTo({
        url: '../userLogin/login?redirectUrl=' + realUrl,
      })
    } else {
      wx.showLoading({
        title: '请稍后...',
      })
      wx.request({
        url: app.serverUrl + '/video/saveComment?fatherCommentId=' + fatherCommentId + "&toUserId=" + toUserId,
        method: 'POST',
        header: {
          'content-type': 'application/json', // 默认值
          'headerUserId': user.id,
          'headerUserToken': user.userToken
        },
        data: {
          fromUserId: user.id,
          videoId: me.data.videoInfo.id,
          comment: content
        },
        success: function(res) {
          console.log(res.data)
          wx.hideLoading();

          me.setData({
            contentValue: "",
            commentsList: [],
            placeholder: "",
            replyFatherCommentId: "",
            replyToUserId: "",
            commentFocus: false
          });


          me.getCommentsList(1);
        }
      })
    }
  },

    getCommentsList: function(page) {
      var me = this;

      var videoId = me.data.videoInfo.id;

      wx.request({
        url: app.serverUrl + '/video/getVideoComments?videoId=' + videoId + "&page=" + page + "&pageSize=5",
        method: "POST",
        success: function(res) {
          console.log(res.data);

          var commentsList = res.data.data.rows;
          var newCommentsList = me.data.commentsList;

          me.setData({
            commentsList: newCommentsList.concat(commentsList),
            commentsPage: page,
            commentsTotalPage: res.data.data.total
          });
        }
      })
    },

    onReachBottom: function() {
      var me = this;
      var currentPage = me.data.commentsPage;
      var totalPage = me.data.commentsTotalPage;
      if (currentPage === totalPage) {
        return;
      }
      var page = currentPage + 1;
      me.getCommentsList(page);
    }
})