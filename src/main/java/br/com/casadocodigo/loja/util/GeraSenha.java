package br.com.casadocodigo.loja.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeraSenha {

	public static void main(String[] args) {
		String senhaCriptografado = new BCryptPasswordEncoder().encode("1234");
        System.out.println(senhaCriptografado);
	}

}
