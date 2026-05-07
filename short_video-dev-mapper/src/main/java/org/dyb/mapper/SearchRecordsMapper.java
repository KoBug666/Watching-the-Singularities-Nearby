package org.dyb.mapper;

import java.util.List;

import org.dyb.pojo.SearchRecords;
import org.dyb.utils.MyMapper;

public interface SearchRecordsMapper extends MyMapper<SearchRecords> {
	public List<String> getHotwords();
}