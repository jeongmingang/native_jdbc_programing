package native_jdbc_programing.dao;

import java.util.List;

import native_jdbc_programing.dto.Title;	//객체 지향 프로그래밍

/**
 * 	C(insert)
 * 	R(select, select where)	
 *	U(update)
 *	D(delete)
 */	
public interface TitleDao {
	List<Title> selectTitleByAll();
	Title selectTitleByNo(Title title);
	
	int insertTitle(Title title);
	int updateTitle(Title title);
	int deleteTitle(Title title);

}
