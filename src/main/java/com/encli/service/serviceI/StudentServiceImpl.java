package com.encli.service.serviceI;

import com.encli.mapper.StudentMapper;
import com.encli.model.Student;
import com.encli.service.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZZP on 2018/8/16.
 */

@Service("studentService")
public class StudentServiceImpl implements StudentServiceI{

    @Autowired
    private StudentMapper studentMapper;


    @Override
    public void addStudent(Student student) {
        studentMapper.addStudent(student);
    }

    @Override
    public void deleteStudent(Integer id) {
        studentMapper.deleteStudent(id);
    }

    @Override
    public void updateStudent(Student student) {
        studentMapper.updateStudent(student);
    }

    @Override
    public Student queryStudentById(Integer id) {
        return studentMapper.queryStudentById(id);
    }

    @Override
    public List<Student> queryAllStudents() {
        return studentMapper.queryAllStudents();
    }
}
