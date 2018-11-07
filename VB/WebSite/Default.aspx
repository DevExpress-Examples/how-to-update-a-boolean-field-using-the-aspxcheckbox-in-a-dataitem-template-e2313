<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v13.1.Web, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to update a Boolean field using the ASPxCheckBox in a DataItem template</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="xds"
			KeyFieldName="Oid">
			<Columns>
				<dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="0" SortOrder="Ascending">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="1">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="2">
					<DataItemTemplate>
						<dx:ASPxCheckBox ID="chk" runat="server" Value='<%#Eval("Active")%>' OnInit="chk_Init">
						</dx:ASPxCheckBox>
					</DataItemTemplate>
				</dx:GridViewDataCheckColumn>
			</Columns>
		</dx:ASPxGridView>
	</div>
	<dx:XpoDataSource ID="xds" runat="server" TypeName="MyObject">
	</dx:XpoDataSource>
	<dx:ASPxCallback ID="cb" runat="server" ClientInstanceName="cb" OnCallback="cb_Callback">
	</dx:ASPxCallback>
	</form>
</body>
</html>
