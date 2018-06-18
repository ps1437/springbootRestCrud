package com.syscho.app.SpringBootCrudJPA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AppController {

	@Autowired
	private AppRepository appRepository;

	@PostMapping("/save")
	public Register register(@RequestBody Register register) {
		Register regObj = appRepository.save(register);
		return regObj;

	}

	@GetMapping("/fetchAll")
	public List<Register> fetchAll() {
		return appRepository.findAll();

	}

	@GetMapping("/fetchByName/{name}")
	public Register fethcByName(@PathVariable("name") String name) {
		return appRepository.findByName(name);

	}

	@DeleteMapping("/deleteAll")
	public boolean deleteAll() {
		appRepository.deleteAll();
		return true;
	}
	
	@DeleteMapping("/deleteByName/{name}")
	public boolean deleteByName(@PathVariable("name") String name) {
		appRepository.deleteByName(name);
		return true;
	}

	@PutMapping("/update")
	public Register update(@RequestBody Register register) {
		Register regObj = appRepository.save(register);
		return regObj;

	}

}
