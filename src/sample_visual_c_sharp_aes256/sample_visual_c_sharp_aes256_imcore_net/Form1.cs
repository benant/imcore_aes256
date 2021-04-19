using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace sample_visual_c_sharp_aes256_imcore_net
{
    public partial class Form1 : Form
    {
        public String key = "abcdefghijklmnopqrstuvwxyz123456";
        AES256Cipher aes;

        public Form1()
        {
            InitializeComponent();
            aes = new AES256Cipher();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String encode = aes.AES_encrypt(textBox1.Text, key);
            richTextBox1.AppendText(encode + Environment.NewLine);
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            String decode = aes.AES_decrypt(textBox2.Text, key);
            richTextBox1.AppendText(decode + Environment.NewLine);
        }
    }
}
