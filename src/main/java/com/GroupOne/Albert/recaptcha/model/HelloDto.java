package com.GroupOne.Albert.recaptcha.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.NonNull;
// Class to map the attributes of the incoming request
//Lombok annotations
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HelloDto {

    @NonNull
    String name;
}
