namespace BakeryMonitor_MVC
{
    partial class frmMain
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
            this.objectListView1 = new BrightIdeasSoftware.ObjectListView();
            this.olvColumn1 = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvColumn2 = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvColumn3 = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvColumn4 = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.btnListen = new System.Windows.Forms.Button();
            this.staMainFormStatus = new System.Windows.Forms.StatusStrip();
            this.slbListenStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.slbLoggingStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.btnEnableLogging = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.objectListView1)).BeginInit();
            this.staMainFormStatus.SuspendLayout();
            this.SuspendLayout();
            // 
            // objectListView1
            // 
            this.objectListView1.AllColumns.Add(this.olvColumn1);
            this.objectListView1.AllColumns.Add(this.olvColumn2);
            this.objectListView1.AllColumns.Add(this.olvColumn3);
            this.objectListView1.AllColumns.Add(this.olvColumn4);
            this.objectListView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.objectListView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.olvColumn1,
            this.olvColumn2,
            this.olvColumn3,
            this.olvColumn4});
            this.objectListView1.Location = new System.Drawing.Point(12, 12);
            this.objectListView1.Name = "objectListView1";
            this.objectListView1.Size = new System.Drawing.Size(932, 573);
            this.objectListView1.TabIndex = 0;
            this.objectListView1.UseCompatibleStateImageBehavior = false;
            this.objectListView1.View = System.Windows.Forms.View.Details;
            // 
            // olvColumn1
            // 
            this.olvColumn1.AspectName = "id";
            this.olvColumn1.Text = "Id";
            this.olvColumn1.Width = 180;
            // 
            // olvColumn2
            // 
            this.olvColumn2.AspectName = "datetime";
            this.olvColumn2.Text = "Date/Time";
            this.olvColumn2.Width = 124;
            // 
            // olvColumn3
            // 
            this.olvColumn3.AspectName = "shortname";
            this.olvColumn3.Text = "Spin name";
            this.olvColumn3.Width = 200;
            // 
            // olvColumn4
            // 
            this.olvColumn4.AspectName = "log";
            this.olvColumn4.FillsFreeSpace = true;
            this.olvColumn4.Text = "Log output";
            this.olvColumn4.Width = 300;
            this.olvColumn4.WordWrap = true;
            // 
            // btnListen
            // 
            this.btnListen.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnListen.Location = new System.Drawing.Point(950, 12);
            this.btnListen.Name = "btnListen";
            this.btnListen.Size = new System.Drawing.Size(144, 23);
            this.btnListen.TabIndex = 1;
            this.btnListen.Text = "Listen";
            this.btnListen.UseVisualStyleBackColor = true;
            this.btnListen.Click += new System.EventHandler(this.btnListen_Click);
            // 
            // staMainFormStatus
            // 
            this.staMainFormStatus.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.slbListenStatus,
            this.slbLoggingStatus});
            this.staMainFormStatus.Location = new System.Drawing.Point(0, 591);
            this.staMainFormStatus.Name = "staMainFormStatus";
            this.staMainFormStatus.Size = new System.Drawing.Size(1099, 22);
            this.staMainFormStatus.TabIndex = 3;
            this.staMainFormStatus.Text = "statusStrip1";
            // 
            // slbListenStatus
            // 
            this.slbListenStatus.AutoSize = false;
            this.slbListenStatus.Name = "slbListenStatus";
            this.slbListenStatus.Size = new System.Drawing.Size(400, 17);
            this.slbListenStatus.Text = "UDP Listener disabled";
            // 
            // slbLoggingStatus
            // 
            this.slbLoggingStatus.AutoSize = false;
            this.slbLoggingStatus.Name = "slbLoggingStatus";
            this.slbLoggingStatus.Size = new System.Drawing.Size(400, 17);
            this.slbLoggingStatus.Text = "File Logging Disabled";
            // 
            // btnEnableLogging
            // 
            this.btnEnableLogging.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEnableLogging.Location = new System.Drawing.Point(950, 41);
            this.btnEnableLogging.Name = "btnEnableLogging";
            this.btnEnableLogging.Size = new System.Drawing.Size(144, 23);
            this.btnEnableLogging.TabIndex = 4;
            this.btnEnableLogging.Text = "Start Logging";
            this.btnEnableLogging.UseVisualStyleBackColor = true;
            this.btnEnableLogging.Click += new System.EventHandler(this.btnEnableLogging_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1099, 613);
            this.Controls.Add(this.btnEnableLogging);
            this.Controls.Add(this.staMainFormStatus);
            this.Controls.Add(this.btnListen);
            this.Controls.Add(this.objectListView1);
            this.Name = "frmMain";
            this.Text = "Bakery Monitor";
            this.Load += new System.EventHandler(this.frmMain_Load);
            ((System.ComponentModel.ISupportInitialize)(this.objectListView1)).EndInit();
            this.staMainFormStatus.ResumeLayout(false);
            this.staMainFormStatus.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private BrightIdeasSoftware.ObjectListView objectListView1;
        private System.Windows.Forms.Button btnListen;
        private BrightIdeasSoftware.OLVColumn olvColumn1;
        private BrightIdeasSoftware.OLVColumn olvColumn2;
        private BrightIdeasSoftware.OLVColumn olvColumn3;
        private BrightIdeasSoftware.OLVColumn olvColumn4;
        private System.Windows.Forms.StatusStrip staMainFormStatus;
        private System.Windows.Forms.ToolStripStatusLabel slbListenStatus;
        private System.Windows.Forms.ToolStripStatusLabel slbLoggingStatus;
        private System.Windows.Forms.Button btnEnableLogging;
    }
}

