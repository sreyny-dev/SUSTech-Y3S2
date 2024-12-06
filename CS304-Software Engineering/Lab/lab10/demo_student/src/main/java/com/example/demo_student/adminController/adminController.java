package com.example.demo_student.adminController;

import com.example.demo_student.model.Student;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/admincontroller")
public class adminController {

    private List<Student> students = createList();

    @RequestMapping(value = "/student", method = RequestMethod.GET, produces = "application/json")
    public List<Student> firstPage() {
        return students;
    }

    @DeleteMapping(path = { "/{id}" })
    public Student delete(@PathVariable("id") String id) {
        Student deletedStu = null;
        for (Student stu : students) {
            if (stu.getStuID().equals(id)) {
                students.remove(stu);
                deletedStu = stu;
                break;
            }
        }
        return deletedStu;
    }

    @PostMapping
    public Student create(@RequestBody Student user) {
        students.add(user);
        System.out.println(students);
        return user;
    }

    private static List<Student> createList() {
        List<Student> tempStudents = new ArrayList<>();
        Student stu1 = new Student();
        stu1.setName("Lily");
        stu1.setDorAddress("Hupan");
        stu1.setStuID("12110001");
        stu1.setScore(3.99);

        Student stu2 = new Student();
        stu2.setName("Jack");
        stu2.setDorAddress("Liyuan");
        stu2.setStuID("12210002");
        stu2.setScore(3.99);
        tempStudents.add(stu1);
        tempStudents.add(stu2);
        return tempStudents;
    }
}

