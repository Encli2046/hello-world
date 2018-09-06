package com.encli.controller;

import com.encli.constant.Constant1;
import com.encli.model.Student;
import com.encli.service.StudentServiceI;
import com.encli.utils.JsonResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ZZP on 2018/8/16.
 */

@Controller
@RequestMapping("student")
public class StudentController {

    @Autowired
    private StudentServiceI studentService;


    //主页
    @RequestMapping()
    public String toHome(@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request, Model model) {

        PageHelper.startPage(page, Constant1.PAGESIZE);
        List<Student> studentList = studentService.queryAllStudents();
        PageInfo<Student> studentPageInfo = new PageInfo<>(studentList);

        model.addAttribute("page", studentPageInfo);
        model.addAttribute("studentList",studentList);

        return "home";
    }

    //学生增加
    @RequestMapping("add")
    @ResponseBody
    public JsonResult add(Student student) {

        JsonResult jsonResult = new JsonResult();

        try {
            studentService.addStudent(student);
            jsonResult.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setStatus(400);
        }

        return jsonResult;
    }

    //学生删除
    @RequestMapping("delete")
    @ResponseBody
    public JsonResult delete(Integer id) {

        JsonResult jsonResult = new JsonResult();
        try {
            studentService.deleteStudent(id);
            jsonResult.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setStatus(400);
        }
        return jsonResult;
    }

    //跳转修改页面
    @RequestMapping("toUpdatePage")
    public ModelAndView toUpdatePage(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        Student student = studentService.queryStudentById(id);
        modelAndView.addObject("studentInfo", student);
        modelAndView.setViewName("update");

        return modelAndView;
    }

    //修改学生信息
    @RequestMapping("update")
    @ResponseBody
    public JsonResult update(Student student) {

        JsonResult jsonResult = new JsonResult();

        try {
            studentService.updateStudent(student);
            jsonResult.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setStatus(400);
        }

        return jsonResult;
    }



}
