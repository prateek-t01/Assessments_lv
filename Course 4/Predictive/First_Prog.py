# print("Hello All!")

import streamlit as st

var_a=st.textbox("")
var_b=st.textbox("")
var_button=st.button("submit")
if var_button:
    var_c= var_a + var_b
    st.success(var_c)
