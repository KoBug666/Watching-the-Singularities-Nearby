package org.dyb.mapper;

import org.dyb.pojo.Users;
import org.dyb.utils.MyMapper;

public interface UsersMapper extends MyMapper<Users> {
	/**
	 * @Description: 用户受喜欢数累加
	 */
	public void addReceiveLikeCount(String userId);
	
	/**
	 * @Description: 用户受喜欢数累减
	 */
	public void reduceReceiveLikeCount(String userId);
	
	/**
	 * @Description: 用户受打赏数累加
	 */
	public void addReceiveShangCount(String userId);
	
	/**
	 * @Description: 用户受打赏数累减
	 */
	public void reduceReceiveShangCount(String userId);
	/**
	 * @Description: 增加粉丝数
	 */
	public void addFansCount(String userId);
	
	/**
	 * @Description: 增加关注数
	 */
	public void addFollersCount(String userId);
	
	/**
	 * @Description: 减少粉丝数
	 */
	public void reduceFansCount(String userId);
	
	/**
	 * @Description: 减少关注数
	 */
	public void reduceFollersCount(String userId);
	
	
	
	
}