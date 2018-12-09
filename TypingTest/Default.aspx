<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TypingTest.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h1 class="auto-style2"><strong>Test your typing speed!</strong></h1>
        </div>
        <h3>When ready to start, press the start button.</h3>
        <h3 style="font-family: Arial, Helvetica, sans-serif">Enter Number of Rounds to Play:&nbsp;
            <asp:DropDownList ID="DropDownList" runat="server" Height="44px" style="font-family: Arial, Helvetica, sans-serif" Width="82px" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem Value="2"></asp:ListItem>
                <asp:ListItem Value="3"></asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
        </h3>
        <p>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Button ID="startBtn" runat="server" OnClick="startBtn_Click" style="font-family: Arial, Helvetica, sans-serif; font-weight: 700" Text="Start" />
        </p>
        <p>
            <asp:Label ID="shownTextLabel" runat="server" Height="193px" style="font-family: Arial, Helvetica, sans-serif" Width="851px"></asp:Label>
        </p>
        <hr />
        <p class="auto-style1">
            <strong>Type the above text in the box below:&nbsp;</strong></p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <span class="auto-style1">Words Per Minute:&nbsp; </span>
                <asp:Label ID="wpmLabel" runat="server" CssClass="auto-style1" Text="0"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">Time Elapsed:&nbsp; </span>
                <asp:Label ID="timeLabel" runat="server" CssClass="auto-style1" Text="0"></asp:Label>
                <span class="auto-style1">s&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Timer ID="Timer" runat="server" Interval="1000" OnTick="Timer_Tick">
                </asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <asp:Panel ID="Panel1" runat="server" DefaultButton="doneBtn">
            
                <ContentTemplate>
                    <asp:TextBox ID="goodInputTB" runat="server" Height="41px" Width="1225px"></asp:TextBox>
                    <br />
                    <asp:Button ID="doneBtn" runat="server" Height="63px" OnClick="doneBtn_Click" Text="Done!" Width="172px" />
                </ContentTemplate>
            
        </asp:Panel>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <h2>
            <asp:Label ID="finishLabel" runat="server"></asp:Label>
        </h2>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
