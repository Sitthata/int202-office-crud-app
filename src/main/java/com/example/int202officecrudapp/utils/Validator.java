package com.example.int202officecrudapp.utils;

public class Validator {
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
