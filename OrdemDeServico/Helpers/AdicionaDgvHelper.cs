﻿using OrdemDeServico.Model;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace OrdemDeServico.Helpers
{
    class AdicionaDgvHelper
    {
        private static void CriarDgvMaquina(DataGridView dgv)
        {
            string[] nomeColuna = new string[] { "Id", "Patrimonio", "Tipo", "Descricao", "Setor", "IdSetor", "Secretaria" };
            string[] textoColuna = new string[] { "Id", "Patrimônio", "Tipo", "Descrição", "Setor", "IdSetor", "Secretaria" };
            int[] tamanho = new[] { 50, 100, 250, 250, 250, 50, 250 };
            bool[] visibilidade = new[] { true, true, true, true, true, false, true };
            Criador.CriaDataGridView(dgv, nomeColuna, textoColuna, tamanho, visibilidade);
        }
        private static void CriarDgvSolicitante(DataGridView dgv)
        {
            string[] nomeColuna = new string[] { "Id", "Nome", "Descricao", "Setor", "IdSetor", "Secretaria" };
            string[] textoColuna = new string[] { "Id", "Nome", "Descrição", "Setor", "IdSetor", "Secretaria" };
            int[] tamanho = new[] { 50, 250, 250, 250, 50, 250 };
            bool[] visibilidade = new[] { true, true, true, true, false, true };
            Criador.CriaDataGridView(dgv, nomeColuna, textoColuna, tamanho, visibilidade);
        }
        public static void PesquisaDgv(DataGridView dgv, TextBox txtPesquisar, List<Maquina> maquinas, Setor setor )
        {
            CriarDgvMaquina(dgv);

            int patrimonio = Convert.ToInt32(txtPesquisar.Text);
            if ((maquinas = PesquisadorHelper.PesquisarMaquina(patrimonio)) != null)
            {
                foreach (Maquina maquina in maquinas)
                {
                    if ((setor = PesquisadorHelper.PesquisarSetor(maquina.SetorMqn.Id)) != null)
                    {
                        maquina.SetorMqn = setor;
                        if ((maquina.SetorMqn.SecretariaStr = PesquisadorHelper.PesquisarSecretaria(maquina.SetorMqn.SecretariaStr.Id)) != null)
                        {
                            dgv.Rows.Add(maquina.Id, maquina.Patrimonio, maquina.Tipo, maquina.Descricao, maquina.SetorMqn.Nome,
                                maquina.SetorMqn.Id, maquina.SetorMqn.SecretariaStr.Nome);
                        }

                    }
                }
            }
        }
        public static void PesquisaDgv(DataGridView dgv, TextBox txtPesquisar, List<Solicitante> solicitantes, Setor setor)
        {
            CriarDgvSolicitante(dgv);
            if ((solicitantes = PesquisadorHelper.PesquisarSolicitante(txtPesquisar.Text)) != null)
            {
                foreach (Solicitante solicitante in solicitantes)
                {
                    if ((setor = PesquisadorHelper.PesquisarSetor(solicitante.SetorSlc.Id)) != null)
                    {
                        solicitante.SetorSlc = setor;
                        if ((solicitante.SetorSlc.SecretariaStr = PesquisadorHelper.PesquisarSecretaria(solicitante.SetorSlc.SecretariaStr.Id)) != null)
                        {
                            dgv.Rows.Add(solicitante.Id, solicitante.Nome, solicitante.Descricao, solicitante.SetorSlc.Nome,
                                solicitante.SetorSlc.Id, solicitante.SetorSlc.SecretariaStr.Nome);
                        }

                    }
                }
            }
        }
        public static bool ObterLinhaDgv(DataGridView dgv, Maquina maquina)
        {

            if (dgv.SelectedRows.Count > 0)
            {
                maquina.Id = Convert.ToInt32(dgv.CurrentRow.Cells[0].Value.ToString());
                maquina.Patrimonio = Convert.ToInt32(dgv.CurrentRow.Cells[1].Value.ToString());
                maquina.Tipo = dgv.CurrentRow.Cells[2].Value.ToString();
                maquina.Descricao = dgv.CurrentRow.Cells[3].Value.ToString();
                maquina.SetorMqn.Nome = dgv.CurrentRow.Cells[4].Value.ToString();
                maquina.SetorMqn.Id = Convert.ToInt32(dgv.CurrentRow.Cells[5].Value);
                return true;
            }
            else
            {
                return false;
            }

        }       
       
        public static bool ObterLinhaDgv(DataGridView dgv, Solicitante solicitante)
        {

            if (dgv.SelectedRows.Count > 0)
            {
                solicitante.Id = Convert.ToInt32(dgv.CurrentRow.Cells[0].Value.ToString());
                solicitante.Nome = dgv.CurrentRow.Cells[1].Value.ToString();
                solicitante.Descricao = dgv.CurrentRow.Cells[2].Value.ToString();
                solicitante.SetorSlc.Nome = dgv.CurrentRow.Cells[3].Value.ToString();
                solicitante.SetorSlc.Id = Convert.ToInt32(dgv.CurrentRow.Cells[4].Value);
                return true;
            }
            else
            {
                return false;
            }

        }
    }
}
