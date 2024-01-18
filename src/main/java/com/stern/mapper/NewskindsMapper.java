package com.stern.mapper;

import com.stern.pojo.Newskinds;
import com.stern.pojo.NewskindsExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 新闻种类 -数据访问层
 */
@Component
public interface NewskindsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    long countByExample(NewskindsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int deleteByExample(NewskindsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer nkid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int insert(Newskinds record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int insertSelective(Newskinds record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    List<Newskinds> selectByExample(NewskindsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    Newskinds selectByPrimaryKey(Integer nkid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Newskinds record, @Param("example") NewskindsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Newskinds record, @Param("example") NewskindsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Newskinds record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table newskinds
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Newskinds record);
}