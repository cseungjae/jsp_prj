package day0516;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class EmpDTO {

	private int EMPNO,MGR,SAL,COMM,DEPTNO;	
	private String ENAME,	JOB	;
	private Date	HIREDATE;	
	
}
