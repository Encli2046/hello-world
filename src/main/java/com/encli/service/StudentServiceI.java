package com.encli.service;

import com.encli.model.Student;

import java.util.List;

/**
 * Created by ZZP on 2018/8/16.
 */
public interface StudentServiceI {

    void addStudent(Student student);

    void deleteStudent(Integer id);

    void updateStudent(Student student);

    Student queryStudentById(Integer id);

    List<Student> queryAllStudents();


}
