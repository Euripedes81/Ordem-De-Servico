﻿using MySql.Data.MySqlClient;
using OrdemDeServico.Model;
using System;
using System.Collections.Generic;
using System.Data;

namespace OrdemDeServico.DAO
{
    class OrdemServicoDAO : ICrud
    {
        public void Delete(object obj)
        {
            OrdemServico ordemDeServico = obj as OrdemServico;
            MySqlCommand comando = new MySqlCommand();
            comando.CommandType = CommandType.Text;
            comando.CommandText = "DELETE FROM ordemdeServico where Id=@Id";
            comando.Parameters.AddWithValue("Id", ordemDeServico.Id);
            ConexaoBancoDAO.CRUD(comando);
        }

        public void Insert(object obj)
        {
            OrdemServico ordemServico = obj as OrdemServico;
            MySqlCommand comando = new MySqlCommand();
            comando.CommandType = CommandType.Text;
            comando.CommandText = "INSERT INTO ordemdeservico (IdSolicitante, IdMaquiana, Diagnostico, DataAbertura, Solucao," +
                " DataFechamento, Observacao, IdAtentende) VALUES (@IdSolicitante, @IdMaquina, @Diagnostico, @DataAbertura, @Solucao" +
                "@DataFechamento, @Observacao, @IdAtentende)";
            comando.Parameters.AddWithValue("Nome", ordemServico.SolicitanteOs.Id);
            comando.Parameters.AddWithValue("Descricao", ordemServico.MaquinaOs.Id);
            comando.Parameters.AddWithValue("Diagnostico", ordemServico.Diagnostico);
            comando.Parameters.AddWithValue("DataAbertura", ordemServico.DataAbertura);
            comando.Parameters.AddWithValue("Solucao", ordemServico.Solucao);
            comando.Parameters.AddWithValue("DataFechamento", ordemServico.DataFechamento);
            comando.Parameters.AddWithValue("Observacao", ordemServico.Observacao);
            comando.Parameters.AddWithValue("IdSetor", ordemServico.Diagnostico);
            ConexaoBancoDAO.CRUD(comando);
        }

        public void Update(object obj)
        {
            OrdemServico ordemDeServico = obj as OrdemServico;
            MySqlCommand comando = new MySqlCommand();
            comando.CommandType = CommandType.Text;
            comando.CommandText = "UPDATE ordemdeservico SET Diagnostico=@Diagnostico  WHERE Id=@Id";
            comando.Parameters.AddWithValue("Id", ordemDeServico.Id);            
            comando.Parameters.AddWithValue("Descricao", ordemDeServico.Diagnostico);
            comando.Parameters.AddWithValue("IdSetor", ordemDeServico.Id);
            ConexaoBancoDAO.CRUD(comando);
        }

        public List<OrdemServico> SelectId(int id)
        {
            MySqlCommand comando = new MySqlCommand();
            comando.CommandType = CommandType.Text;
            comando.CommandText = "SELECT * FROM ordemdeservico WHERE Id=@Id";
            comando.Parameters.AddWithValue("Id", id);
            MySqlDataReader dr = ConexaoBancoDAO.Selecionar(comando);
            List<OrdemServico> ordemServicos = new List<OrdemServico>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    OrdemServico ordemServico = new OrdemServico();
                    ordemServico.Id = Convert.ToInt32(dr["Id"]);
                    ordemServico.SolicitanteOs.Id = Convert.ToInt32(dr["IdSolicitante"]);
                    ordemServico.MaquinaOs.Id = Convert.ToInt32(dr["IdMaquina"]);
                    ordemServico.Diagnostico = Convert.ToString(dr["IdSetor"]);
                    ordemServico.DataAbertura = Convert.ToDateTime(dr["DataAbertura"]);
                    ordemServico.Diagnostico = Convert.ToString(dr["Diagnostico"]);
                    ordemServico.DataFechamento = Convert.ToDateTime(dr["DataFechamento"]);
                    ordemServico.Observacao = Convert.ToString(dr["Observacao"]);
                    ordemServico.SolicitanteOs.Id = Convert.ToInt32(dr["IdAtendente"]);
                    ordemServicos.Add(ordemServico);
                }
            }
            else
            {
                ordemServicos = null;
            }
            dr.Close();
            return ordemServicos;
        }
    }
}