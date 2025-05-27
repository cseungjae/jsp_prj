package kr.co.sist.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RangeDTO {
	private String field, keyword;
	private int currentPage=1, startNum, endNum;//현재 페이지, 시작번호, 끝번호
}
