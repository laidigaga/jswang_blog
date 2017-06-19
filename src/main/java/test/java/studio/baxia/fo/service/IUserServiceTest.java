package test.java.studio.baxia.fo.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import studio.baxia.fo.pojo.Authors;
import studio.baxia.fo.service.IUserService;
import studio.baxia.fo.util.MDUtil;
import test.java.studio.baxia.fo.BaseTest;

import java.security.NoSuchAlgorithmException;

/**
 * Created by admin on 2016/10/11.
 */
public class IUserServiceTest extends BaseTest {
    @Autowired
    private IUserService userService;

    // 获取当前方法名
    // new Throwable().getStackTrace()[0].getMethodName();

    @Test
    @Rollback(value = false)
    public void testAddAuthors() throws NoSuchAlgorithmException {
        String userName = "admin";
        String userPass = "admin";
        String pass = MDUtil.generatePass(userName, userPass);
        int userStatus = 1;
        Authors authors = new Authors(userName,pass,userStatus);
        Integer result = userService.authorsAdd(authors);
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }
    @Test
    public void testEditAuthorsStatus(){
        Boolean result = userService.authorsEditStatus(1, 0);
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }

    @Test
    public void testGetAuthorsById() throws Exception {
        Authors result = userService.authorsGetById(1);
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }

    @Test
    public void testGetAuthorsByAccount() throws Exception {
        Authors result = userService.authorsGetByAccount("admin");
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }

    @Test
    public void testGetAuthorsByEmail() throws Exception {
        Authors result = userService.authorsGetByEmail("admin");
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }
}
