package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {
	
	private Connection conn;
	
	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment ap)
	{
		boolean f = false;
		
		try {
			
			String sql = "insert into appointment(user_id,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullname());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppointDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			int i = ps.executeUpdate();
			if( i==1 ) {
				f = true;
			}
		}
		catch ( Exception e  ) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
				{
					ap = new Appointment();
					ap.setUserId(rs.getInt(1));
					ap.setFullname(rs.getString(2));
					ap.setGender(rs.getString(3));
					ap.setAge(rs.getString(4));
					ap.setAppointDate(rs.getString(5));
					ap.setEmail(rs.getString(6));
					ap.setPhNo(rs.getString(7));
					ap.setDiseases(rs.getString(8));
					ap.setDoctorId(rs.getInt(9));
					ap.setAddress(rs.getString(10));
					ap.setStatus(rs.getString(11));
					list.add(ap);
				}
		}
		catch ( Exception e ) {
			e.printStackTrace();
		}
		return list;
	}

}
