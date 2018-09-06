package com.encli.mapper;

import com.encli.model.Student;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2018/8/16.
 */
public interface StudentMapper {

    void addStudent(Student student);

    void deleteStudent(Integer id);

    void updateStudent(Student student);

    Student queryStudentById(Integer id);

    List<Student> queryAllStudents();



}
