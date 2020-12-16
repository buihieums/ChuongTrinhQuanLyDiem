namespace ChuongTrinhQuanLyDiem
{
    partial class Form_DangNhap
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.pnDangNhap = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.textBox_User = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBox_Pass = new System.Windows.Forms.TextBox();
            this.checDk = new System.Windows.Forms.CheckBox();
            this.button_DangNhap = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.pnDangNhap.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pnDangNhap
            // 
            this.pnDangNhap.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnDangNhap.Controls.Add(this.label2);
            this.pnDangNhap.Controls.Add(this.label1);
            this.pnDangNhap.Controls.Add(this.pictureBox1);
            this.pnDangNhap.Controls.Add(this.label9);
            this.pnDangNhap.Controls.Add(this.label8);
            this.pnDangNhap.Controls.Add(this.label7);
            this.pnDangNhap.Controls.Add(this.label4);
            this.pnDangNhap.Controls.Add(this.textBox_User);
            this.pnDangNhap.Controls.Add(this.label5);
            this.pnDangNhap.Controls.Add(this.textBox_Pass);
            this.pnDangNhap.Controls.Add(this.checDk);
            this.pnDangNhap.Controls.Add(this.button_DangNhap);
            this.pnDangNhap.ForeColor = System.Drawing.SystemColors.Highlight;
            this.pnDangNhap.Location = new System.Drawing.Point(605, 1);
            this.pnDangNhap.Name = "pnDangNhap";
            this.pnDangNhap.Size = new System.Drawing.Size(378, 613);
            this.pnDangNhap.TabIndex = 1;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::ChuongTrinhQuanLyDiem.Properties.Resources.close5;
            this.pictureBox1.Location = new System.Drawing.Point(336, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(42, 40);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click_1);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(238)))), ((int)(((byte)(26)))), ((int)(((byte)(74)))));
            this.label9.Location = new System.Drawing.Point(37, 115);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(228, 29);
            this.label9.TabIndex = 38;
            this.label9.Text = "Đăng nhập hệ thống";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.SystemColors.Control;
            this.label8.Location = new System.Drawing.Point(278, 376);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(62, 18);
            this.label8.TabIndex = 34;
            this.label8.Text = "Đăng ký";
            this.label8.Click += new System.EventHandler(this.label8_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.SystemColors.Control;
            this.label7.Location = new System.Drawing.Point(136, 376);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(136, 18);
            this.label7.TabIndex = 37;
            this.label7.Text = "Chưa có tài khoản?";
            this.label7.Click += new System.EventHandler(this.label7_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(238)))), ((int)(((byte)(26)))), ((int)(((byte)(74)))));
            this.label4.Location = new System.Drawing.Point(37, 168);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(116, 20);
            this.label4.TabIndex = 35;
            this.label4.Text = "Tên đăng nhập";
            // 
            // textBox_User
            // 
            this.textBox_User.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.textBox_User.Location = new System.Drawing.Point(41, 191);
            this.textBox_User.Name = "textBox_User";
            this.textBox_User.Size = new System.Drawing.Size(300, 26);
            this.textBox_User.TabIndex = 30;
            this.textBox_User.Text = "nhom1";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(238)))), ((int)(((byte)(26)))), ((int)(((byte)(74)))));
            this.label5.Location = new System.Drawing.Point(38, 231);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(75, 20);
            this.label5.TabIndex = 36;
            this.label5.Text = "Mật khẩu";
            // 
            // textBox_Pass
            // 
            this.textBox_Pass.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.textBox_Pass.Location = new System.Drawing.Point(42, 254);
            this.textBox_Pass.Multiline = true;
            this.textBox_Pass.Name = "textBox_Pass";
            this.textBox_Pass.PasswordChar = '*';
            this.textBox_Pass.Size = new System.Drawing.Size(300, 26);
            this.textBox_Pass.TabIndex = 31;
            this.textBox_Pass.Text = "1";
            // 
            // checDk
            // 
            this.checDk.AutoSize = true;
            this.checDk.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.checDk.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(238)))), ((int)(((byte)(26)))), ((int)(((byte)(74)))));
            this.checDk.Location = new System.Drawing.Point(41, 286);
            this.checDk.Name = "checDk";
            this.checDk.Size = new System.Drawing.Size(112, 20);
            this.checDk.TabIndex = 32;
            this.checDk.Text = "Hiện mật khẩu";
            this.checDk.UseVisualStyleBackColor = true;
            this.checDk.CheckedChanged += new System.EventHandler(this.checDk_CheckedChanged_1);
            // 
            // button_DangNhap
            // 
            this.button_DangNhap.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(238)))), ((int)(((byte)(26)))), ((int)(((byte)(74)))));
            this.button_DangNhap.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button_DangNhap.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.button_DangNhap.ForeColor = System.Drawing.Color.White;
            this.button_DangNhap.Location = new System.Drawing.Point(41, 329);
            this.button_DangNhap.Name = "button_DangNhap";
            this.button_DangNhap.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.button_DangNhap.Size = new System.Drawing.Size(300, 33);
            this.button_DangNhap.TabIndex = 33;
            this.button_DangNhap.Text = "Đăng nhập";
            this.button_DangNhap.UseVisualStyleBackColor = false;
            this.button_DangNhap.Click += new System.EventHandler(this.button_DangNhap_Click_1);
            // 
            // panel1
            // 
            this.panel1.BackgroundImage = global::ChuongTrinhQuanLyDiem.Properties.Resources.anhbia3;
            this.panel1.Location = new System.Drawing.Point(-1, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(610, 597);
            this.panel1.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.Control;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(187, 376);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 18);
            this.label1.TabIndex = 39;
            this.label1.Text = "Đăng ký";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.SystemColors.Control;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.Desktop;
            this.label2.Location = new System.Drawing.Point(243, 376);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(97, 18);
            this.label2.TabIndex = 40;
            this.label2.Text = "tài khoản mới";
            // 
            // Form_DangNhap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::ChuongTrinhQuanLyDiem.Properties.Resources.anhbia;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(984, 611);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.pnDangNhap);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Form_DangNhap";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "p";
            this.Load += new System.EventHandler(this.Form_DangNhap_Load);
            this.pnDangNhap.ResumeLayout(false);
            this.pnDangNhap.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnDangNhap;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBox_User;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBox_Pass;
        private System.Windows.Forms.CheckBox checDk;
        private System.Windows.Forms.Button button_DangNhap;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}