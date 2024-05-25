# print("Hello All!")

import code
import streamlit as st

var_a=st.text_input("Name",key="text1")
var_b=st.text_input("Surname",key="text2")

var_button=st.button("submit")
if var_button:
    var_c= var_a + var_b
    st.success(var_c)
"D:\Analytics Bootcamp\Python\Code\app.py"