﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    Session session = XpoHelper.GetNewSession();

    protected void Page_Init(object sender, EventArgs e) {
        xds.Session = session;
    }

    protected void chk_Init(object sender, EventArgs e) {
        ASPxCheckBox chk = sender as ASPxCheckBox;
        GridViewDataItemTemplateContainer container = chk.NamingContainer as GridViewDataItemTemplateContainer;

        chk.ClientSideEvents.CheckedChanged = String.Format("function (s, e) {{ cb.PerformCallback('{0}|' + s.GetChecked()); }}", container.KeyValue);
    }
    protected void cb_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        String[] p = e.Parameter.Split('|');

        MyObject obj = session.GetObjectByKey<MyObject>(Convert.ToInt32(p[0])); // get the record from the Session
        obj.Active = Convert.ToBoolean(p[1]);

        obj.Save();
    }
}
