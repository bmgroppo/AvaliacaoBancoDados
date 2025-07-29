CREATE DATABASE PETSHOP;
USE PETSHOP;

CREATE TABLE Cliente (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  CPF VARCHAR(11),
  Telefone VARCHAR(15),
  email VARCHAR(30));

CREATE TABLE Animal (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  especie VARCHAR(50),
  raca VARCHAR(50),
  idade INT,
  idCliente INT);

CREATE TABLE Servico (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(50),
  duracao INT,
  preco DECIMAL(10,2));

CREATE TABLE Agendamento (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data DATE,
  horario TIME,
  status VARCHAR(30),
  idAnimal INT,
  idServico INT);

-- Definindo as chaves estrangeiras
ALTER TABLE Animal
  ADD FOREIGN KEY (idCliente) REFERENCES Cliente(id);

ALTER TABLE Agendamento
  ADD FOREIGN KEY (idAnimal) REFERENCES Animal(id),
  ADD FOREIGN KEY (idServico) REFERENCES Servico(id);