package com.mysite.util;

import ch.qos.logback.classic.pattern.ClassicConverter;
import ch.qos.logback.classic.spi.ILoggingEvent;

public class LogConverter extends ClassicConverter {
    
    @Override
    public String convert(ILoggingEvent event) {
        String message = event.getFormattedMessage();

        return message.trim();
    }

}
