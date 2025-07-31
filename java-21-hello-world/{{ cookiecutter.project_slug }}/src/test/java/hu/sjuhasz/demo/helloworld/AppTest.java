package hu.sjuhasz.demo.helloworld;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class AppTest {

    @Test
    void testAdd() {
        assertEquals(2, App.add(1,1));
    }

}
