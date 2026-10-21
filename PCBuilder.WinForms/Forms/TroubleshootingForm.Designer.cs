namespace PCBuilder.Forms;
partial class TroubleshootingForm
{
 private System.ComponentModel.IContainer? components; private Label _question=null!; private FlowLayoutPanel _answers=null!; private RichTextBox _diagnosis=null!; private Button _back=null!,_restart=null!;

    private FlowLayoutPanel bottom=null!;
    private void InitializeComponent()
    {
        _question = new Label();
        _answers = new FlowLayoutPanel();
        _diagnosis = new RichTextBox();
        _back = new Button();
        _restart = new Button();
        bottom = new FlowLayoutPanel();
        bottom.SuspendLayout();
        SuspendLayout();
        // 
        // _question
        // 
        _question.Dock = DockStyle.Top;
        _question.Font = new Font("Segoe UI", 15F, FontStyle.Bold);
        _question.Location = new Point(0, 0);
        _question.Name = "_question";
        _question.Size = new Size(1165, 100);
        _question.TabIndex = 2;
        _question.TextAlign = ContentAlignment.MiddleLeft;
        // 
        // _answers
        // 
        _answers.AutoScroll = true;
        _answers.Dock = DockStyle.Fill;
        _answers.FlowDirection = FlowDirection.TopDown;
        _answers.Location = new Point(0, 100);
        _answers.Name = "_answers";
        _answers.Size = new Size(1165, 408);
        _answers.TabIndex = 0;
        _answers.WrapContents = false;
        // 
        // _diagnosis
        // 
        _diagnosis.Dock = DockStyle.Fill;
        _diagnosis.Location = new Point(0, 100);
        _diagnosis.Name = "_diagnosis";
        _diagnosis.ReadOnly = true;
        _diagnosis.Size = new Size(1165, 408);
        _diagnosis.TabIndex = 1;
        _diagnosis.Text = "";
        _diagnosis.Visible = false;
        // 
        // _back
        // 
        _back.Enabled = false;
        _back.Location = new Point(3, 3);
        _back.Name = "_back";
        _back.Size = new Size(100, 23);
        _back.TabIndex = 0;
        _back.Text = "Quay lại";
        // 
        // _restart
        // 
        _restart.Location = new Point(109, 3);
        _restart.Name = "_restart";
        _restart.Size = new Size(110, 23);
        _restart.TabIndex = 1;
        _restart.Text = "Bắt đầu lại";
        // 
        // bottom
        // 
        bottom.Controls.Add(_back);
        bottom.Controls.Add(_restart);
        bottom.Dock = DockStyle.Bottom;
        bottom.Location = new Point(0, 508);
        bottom.Name = "bottom";
        bottom.Size = new Size(1165, 48);
        bottom.TabIndex = 3;
        // 
        // TroubleshootingForm
        // 
        BackColor = Color.FromArgb(245, 247, 251);
        ClientSize = new Size(1165, 556);
        Controls.Add(_answers);
        Controls.Add(_diagnosis);
        Controls.Add(_question);
        Controls.Add(bottom);
        Name = "TroubleshootingForm";
        Text = "Trợ lý chẩn đoán sự cố";
        bottom.ResumeLayout(false);
        ResumeLayout(false);
    }
    protected override void Dispose(bool disposing){if(disposing)components?.Dispose();base.Dispose(disposing);}
}
