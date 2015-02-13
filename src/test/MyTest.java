package test;

import api.ucenter.Client;

/**
 * Created by lohas on 2014/12/23.
 */
public class MyTest {
    public static void main(String[] args) {
        Client uc = new Client();

        String $returns = uc.uc_user_register("test2", "test2", "11112@qq.com");
        int $uid = Integer.parseInt($returns);
        if ($uid <= 0) {
            if ($uid == -1) {
                System.out.print("用户名不合法");
            } else if ($uid == -2) {
                System.out.print("包含要允许注册的词语");
            } else if ($uid == -3) {
                System.out.print("用户名已经存在");
            } else if ($uid == -4) {
                System.out.print("Email 格式有误");
            } else if ($uid == -5) {
                System.out.print("Email 不允许注册");
            } else if ($uid == -6) {
                System.out.print("该 Email 已经被注册");
            } else {
                System.out.print("未定义");
            }
        } else {
            System.out.println("OK:" + $returns);
        }
    }

}
