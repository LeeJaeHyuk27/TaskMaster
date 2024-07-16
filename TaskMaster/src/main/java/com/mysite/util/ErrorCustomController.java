package com.mysite.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class ErrorCustomController implements ErrorController{
    @RequestMapping("/error")
    public String error(Model model, HttpServletRequest request) {
        Object statusCode = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Object errorMessage = request.getAttribute(RequestDispatcher.ERROR_MESSAGE);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedTimestamp = LocalDateTime.now().format(formatter);

        if (statusCode == null) {
            statusCode = 404;
        }

        if (errorMessage == null) {
            errorMessage = "Resource not found";
        }

        model.addAttribute("status", statusCode.toString());
        model.addAttribute("message", errorMessage != null ? errorMessage.toString() : "N/A");
        model.addAttribute("timestamp", formattedTimestamp);

        return "error";
    }
}
