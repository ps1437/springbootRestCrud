package com.syscho.app.SpringBootCrudJPA;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
@Transactional
public interface AppRepository extends CrudRepository<Register, Long>  {
 public List<Register>  findAll();

public Register findByName(String name);

public void deleteByName(String name);

}
