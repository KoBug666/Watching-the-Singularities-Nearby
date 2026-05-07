package org.dyb.service;

import java.util.List;

import org.dyb.pojo.Comments;
import org.dyb.pojo.Videos;
import org.dyb.utils.PagedResult;

public interface VideoService {
	
	/**
	 * @Description: 保存视频
	 */
	public String saveVideo(Videos video);
	
	/**
	 * @Description: 修改视频的封面
	 */
	public void updateVideo(String videoId, String coverPath);
	
	/**
	 * @Description: 分页查询视频列表
	 * isSaveRecord：1 - 需要保存
	 * 				 0 - 不需要保存 ，或者为空的时候
	 */
	public PagedResult getAllVideos(Videos video, Integer isSaveRecord, 
			Integer page, Integer pageSize);
	
	/**
	 * @Description: 查询我喜欢的视频列表
	 */
	public PagedResult queryMyLikeVideos(String userId, Integer page, Integer pageSize);
	
	/**
	 * @Description: 查询我关注的人的视频列表
	 */
	public PagedResult queryMyFollowVideos(String userId, Integer page, Integer pageSize);
	
	/**
	 * @Description: 获取热搜词列表
	 */
	public List<String> getHotwords();
	
	/**
	 * @Description: 用户喜欢/点赞视频
	 */
	public void userLikeVideo(String userId, String videoId, String videoCreaterId);
	
	/**
	 * @Description: 用户不喜欢/取消点赞视频
	 */
	public void userUnLikeVideo(String userId, String videoId, String videoCreaterId);
	
	/**
	 * @Description: 用户留言
	 */
	public void saveComment(Comments comment);
	
	/**
	 * @Description: 留言分页
	 */
	public PagedResult getAllComments(String videoId, Integer page, Integer pageSize);
}


