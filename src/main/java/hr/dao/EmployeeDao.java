package hr.dao;

import java.util.List;

import helper.JdbcTemplate;
import hr.dto.EmpListDto;
import hr.vo.Employee;

public class EmployeeDao {
	
	public int getTotalRows() {
		String sql = """
			select count(*) cnt 
			from employees
		""";
		return JdbcTemplate.selectOne(sql, rs -> {
			int cnt = rs.getInt("cnt");
			return cnt;
		});
	}
	
	public void insertEmployee(Employee emp) {
		String sql = """
			insert into employees
			(employee_id, first_name, last_name, email, phone_number,
			 hire_date, job_id, salary, commission_pct, department_id)
			values
			(EMPLOYEES_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		""";
		
		JdbcTemplate.insert(sql, emp.getFirstName(),
				                 emp.getLastName(),
				                 emp.getEmail(),
				                 emp.getPhoneNumber(),
				                 emp.getHireDate(),
				                 emp.getJobId(),
				                 emp.getSalary(),
				                 emp.getCommissionPct(),
				                 emp.getDepartmentId());
	}
	
	public List<EmpListDto> getEmployees(int start, int end) {
		String sql = """
			SELECT X.EMPLOYEE_ID,
				   X.FIRST_NAME,
				   X.PHONE_NUMBER,
				   X.HIRE_DATE,
				   X.JOB_ID,
				   D.DEPARTMENT_NAME
			FROM (SELECT 
						ROW_NUMBER() OVER (ORDER BY E.EMPLOYEE_ID DESC) NUM,
						E.EMPLOYEE_ID, E.FIRST_NAME, E.PHONE_NUMBER, E.HIRE_DATE,
						E.JOB_ID, E.DEPARTMENT_ID
				  FROM
						EMPLOYEES E) X, DEPARTMENTS D
			WHERE X.NUM BETWEEN ? AND ?
			AND X.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
		""";
		
		return JdbcTemplate.selectList(sql, rs -> {
			EmpListDto dto = new EmpListDto();
			dto.setId(rs.getInt("employee_id"));
			dto.setFirstName(rs.getString("first_name"));
			dto.setPhoneNumber(rs.getString("phone_number"));
			dto.setHireDate(rs.getDate("hire_date"));
			dto.setJobId(rs.getString("job_id"));
			dto.setDepartmentName(rs.getString("department_name"));
			return dto;
		}, start, end);
	}

}
