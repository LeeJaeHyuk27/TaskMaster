<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error</title>
        <link rel="stylesheet" href="/resources/css/error.css">
    </head>

    <body>
        <div style="margin: 0 auto; width: 1200px;">
            <h1 style="text-align: center;">ERROR</h1>
            <h3 style="text-align: center;">Status: ${status}</h3>
            <h3 style="text-align: center;">Message: ${message}</h3>
            <h3 style="text-align: center;">Timestamp: ${timestamp}<h3>
        </div>
        <div style="margin: 0 auto; width: 1200px; height: 500px;">
            <div class="cube">
                <div class="big">
                    <span style="--i:0;--clr: #e2e2e2;">ERROR</span>
                    <span style="--i:1;--clr: #f0f0f0;">ERROR</span>
                    <span style="--i:2;--clr: #e2e2e2;">ERROR</span>
                    <span style="--i:3;--clr: #f0f0f0;">ERROR</span>
                    <span class="top" style="--clr: #fff;"></span>
                </div>
            </div>
        </div>
    </body>

    </html>