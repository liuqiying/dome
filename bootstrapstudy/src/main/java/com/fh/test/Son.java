package com.fh.test;

import org.junit.Test;

public class Son extends father{
    @Test
    public void son2(){
        System.out.println("子构6");
    }
    static{
        System.out.println("子静2");
    }
    {
        System.out.println("子方5");
    }
}
