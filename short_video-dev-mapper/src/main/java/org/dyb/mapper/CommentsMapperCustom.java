package org.dyb.mapper;

import java.util.List;

import org.dyb.pojo.Comments;
import org.dyb.pojo.vo.CommentsVO;
import org.dyb.utils.MyMapper;

public interface CommentsMapperCustom extends MyMapper<Comments> {
	
	public List<CommentsVO> queryComments(String videoId);
}