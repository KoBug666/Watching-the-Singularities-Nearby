package org.dyb.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.dyb.mapper.UsersFansMapper;
import org.dyb.mapper.UsersLikeVideosMapper;
import org.dyb.mapper.UsersMapper;
import org.dyb.mapper.UsersReportMapper;
import org.dyb.pojo.Users;
import org.dyb.pojo.UsersFans;
import org.dyb.pojo.UsersLikeVideos;
import org.dyb.pojo.UsersReport;
import org.dyb.service.UserService;
import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UsersMapper userMapper;
	
	@Autowired
	private UsersFansMapper usersFansMapper;
	
	@Autowired
	private UsersLikeVideosMapper usersLikeVideosMapper;
	
	@Autowired
	private UsersReportMapper usersReportMapper;
	
	@Autowired
	private Sid sid;
	
	@Transactional(propagation = Propagation.SUPPORTS)
	@Override
	public boolean queryUsernameIsExist(String username) {
		
		Users user = new Users();
		user.setUsername(username);
		
		Users result = userMapper.selectOne(user);
		
		return result == null ? false : true;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void saveUser(Users user) {
		String userId = sid.nextShort();
		user.setId(userId);
		userMapper.insert(user);
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	@Override
	public Users queryUserForLogin(String username, String password) {
		
		Example userExample = new Example(Users.class);
		Criteria criteria = userExample.createCriteria();
		criteria.andEqualTo("username", username);
		criteria.andEqualTo("password", password);
		Users result = userMapper.selectOneByExample(userExample);
		
		return result;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void updateUserInfo(Users user) {
		Example userExample = new Example(Users.class);
		Criteria criteria = userExample.createCriteria();
		criteria.andEqualTo("id", user.getId());
		userMapper.updateByExampleSelective(user, userExample);
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	@Override
	public Users queryUserInfo(String userId) {
		Example userExample = new Example(Users.class);
		Criteria criteria = userExample.createCriteria();
		criteria.andEqualTo("id", userId);
		Users user = userMapper.selectOneByExample(userExample);
		return user;
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	@Override
	public boolean isUserLikeVideo(String userId, String videoId) {
		if (StringUtils.isBlank(userId) || StringUtils.isBlank(videoId)) {
			return false;
		}
		
		Example example = new Example(UsersLikeVideos.class);
		Criteria criteria = example.createCriteria();
		
		criteria.andEqualTo("userId", userId);
		criteria.andEqualTo("videoId", videoId);
		
		List<UsersLikeVideos> list = usersLikeVideosMapper.selectByExample(example);
		
		if (list != null && list.size() >0) {
			return true;
		}
		
		return false;
	}

	/**
	 * 保存用户关注关系
	 * @param userId 被关注用户的ID
	 * @param fanId 关注者的用户ID
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void saveUserFanRelation(String userId, String fanId) {
		// 生成关注关系的唯一ID
		String relId = sid.nextShort();
		
		// 创建关注关系对象
		UsersFans userFan = new UsersFans();
		userFan.setId(relId);           // 设置关系ID
		userFan.setUserId(userId);      // 设置被关注用户ID
		userFan.setFanId(fanId);        // 设置关注者ID
		
		// 将关注关系插入到数据库
		usersFansMapper.insert(userFan);
		
		// 更新被关注用户的粉丝数（+1）
		userMapper.addFansCount(userId);
		// 更新关注者的关注数（+1）
		userMapper.addFollersCount(fanId);
	}

	/**
	 * 删除用户关注关系（取消关注）
	 * @param userId 被取消关注用户的ID
	 * @param fanId 取消关注者的用户ID
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void deleteUserFanRelation(String userId, String fanId) {
		// 创建查询条件对象
		Example example = new Example(UsersFans.class);
		Criteria criteria = example.createCriteria();
		
		// 设置删除条件：匹配用户ID和粉丝ID
		criteria.andEqualTo("userId", userId);  // 被关注用户ID
		criteria.andEqualTo("fanId", fanId);    // 关注者ID
		
		// 根据条件删除关注关系记录
		usersFansMapper.deleteByExample(example);
		
		// 更新被关注用户的粉丝数（-1）
		userMapper.reduceFansCount(userId);
		userMapper.reduceFollersCount(fanId);
	}

	@Override
	public boolean queryIfFollow(String userId, String fanId) {
		Example example = new Example(UsersFans.class);
		Criteria criteria = example.createCriteria();
		
		criteria.andEqualTo("userId", userId);
		criteria.andEqualTo("fanId", fanId);
		
		List<UsersFans> list = usersFansMapper.selectByExample(example);
		
		if (list != null && !list.isEmpty() && list.size() > 0) {
			return true;
		}
		
		return false;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void reportUser(UsersReport userReport) {
		String urId = sid.nextShort();
		userReport.setId(urId);
		userReport.setCreateDate(new Date());
		
		usersReportMapper.insert(userReport);
	}

}
