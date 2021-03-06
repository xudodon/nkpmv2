﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstanceLog.ascx.cs" Inherits="EZ.WebBase.SysFolder.WorkFlow.UserControl.InstanceLog" %>
<asp:GridView CssClass="dealInfoTbl" ID="LogGridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="3" Width="100%" onrowdatabound="GridView1_RowDataBound">
    <RowStyle Height="25" />
    <Columns>
        <asp:TemplateField HeaderText="序号" HeaderStyle-HorizontalAlign="Center">
            <ItemStyle Width="40" ForeColor="Red" HorizontalAlign="Center" />
             <ItemTemplate>
                <b><%# this.LogGridView1.PageIndex * this.LogGridView1.PageSize + this.LogGridView1.Rows.Count + 1%></b>
             </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="操作人" HeaderStyle-HorizontalAlign="Center">
            <ItemStyle Width="50" HorizontalAlign="Center" />
             <ItemTemplate><%#Eval("EmpName")%></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField ItemStyle-Width="120" HeaderText="操作时间" DataField="LogTime"  DataFormatString="{0:yyyy-MM-dd HH:mm}" />
        <asp:BoundField HeaderText="处理意见" DataField="LogContent" />
    </Columns>
</asp:GridView>

