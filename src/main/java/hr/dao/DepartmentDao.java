package hr.dao;

import java.util.List;

import helper.JdbcTemplate;
import hr.dto.DepartDetailDto;
import hr.vo.Department;

public class DepartmentDao {
	
	public DepartDetailDto getDepartmentDetail(int deptId) {
		String sql = """
			SELECT	D.DEPARTMENT_ID,
					D.DEPARTMENT_NAME,
					D.MANAGER_ID,
					M.FIRST_NAME,
					L.LOCATION_ID,
					L.CITY,
					L.STREET_ADDRESS
			FROM 	DEPARTMENTS D, EMPLOYEES M, LOCATIONS L
			WHERE D.DEPARTMENT_ID = ?
			AND D.MANAGER_ID = M.EMPLOYEE_ID
			AND D.LOCATION_ID = L.LOCATION_ID	
		""";
		
		return JdbcTemplate.selectOne(sql, rs -> {
			DepartDetailDto dto = new DepartDetailDto();
			dto.setId(rs.getInt("department_id"));
			dto.setName(rs.getString("department_name"));
			dto.setManagerId(rs.getInt("manager_id"));
			dto.setManagerName(rs.getString("first_name"));
			dto.setLocationId(rs.getInt("location_id"));
			dto.setCity(rs.getString("city"));
			dto.setStreetAddress(rs.getString("street_address"));
			
			return dto;
		}, deptId);
	}
	
	public List<Department> getAllDepartments() {
		String sql = """
			SELECT
					DEPARTMENT_ID,
					DEPARTMENT_NAME,
					MANAGER_ID,
					LOCATION_ID
			FROM 
					DEPARTMENTS
			WHERE
					MANAGER_ID IS NOT NULL
			ORDER BY
					DEPARTMENT_ID ASC
		""";
		
		return JdbcTemplate.selectList(sql, rs -> {
			Department dept = new Department();
			dept.setId(rs.getInt("department_id"));
			dept.setName(rs.getString("department_name"));
			dept.setManagerId(rs.getInt("manager_id"));
			dept.setLocationId(rs.getInt("location_id"));

			return dept;
		});
	}

}
