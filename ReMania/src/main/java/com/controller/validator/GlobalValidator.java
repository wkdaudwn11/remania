package com.controller.validator;

import static org.hamcrest.CoreMatchers.instanceOf;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.entity.member.MemberDTO;

public class GlobalValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		/*if(MemberDTO.class.isAssignableFrom(arg0)){
			return true;
		}else{
			return false;
		}*/
		return true;
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		
		/*if(arg0 instanceof MemberDTO){
			MemberDTO dto = (MemberDTO)arg0;
			ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "email", null, "이메일을 입력해주세요.");
			ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "pwd", null, "비밀번호를 입력해주세요.");
		}*/
		
	}

}
