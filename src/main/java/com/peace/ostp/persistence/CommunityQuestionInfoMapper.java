package com.peace.ostp.persistence;

import com.peace.ostp.domain.CommunityQuestionInfo;

public interface CommunityQuestionInfoMapper {
    int deleteByPrimaryKey(Integer questionid);

    int insert(CommunityQuestionInfo record);

    int insertSelective(CommunityQuestionInfo record);

    CommunityQuestionInfo selectByPrimaryKey(Integer questionid);

    int updateByPrimaryKeySelective(CommunityQuestionInfo record);

    int updateByPrimaryKey(CommunityQuestionInfo record);
}