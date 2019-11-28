package com.fh.test;

import org.junit.Test;

public class father {
    @Test
    public void father(){
        System.out.println("父构4");
    }
    static{
        System.out.println("父静1");
    }
    {
        System.out.println("父方3");
    }
}
