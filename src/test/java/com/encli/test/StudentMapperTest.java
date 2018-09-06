package com.encli.test;

import com.encli.mapper.StudentMapper;
import com.encli.model.Student;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2018/8/16.
 */
public class StudentMapperTest {

    private  ApplicationContext ctx;

    @Before
    public void before(){

        ctx= new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
    }

    @Test
    public void testListAll(){
        StudentMapper mapper = ctx.getBean(StudentMapper.class);

        List<Student> students = mapper.queryAllStudents();
        PageHelper.startPage(1,3);

        PageInfo<Student> studentPageInfo = new PageInfo<>(students);

        System.out.println(students);
        /*System.out.println(studentPageInfo.getTotal());
        System.out.println(studentPageInfo.getPages());
        System.out.println(studentPageInfo.getPageNum());
        System.out.println(studentPageInfo.getPageSize());*/


    }
}
