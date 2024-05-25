import code
import streamlit as st


def clear():
    st.session_state.name = ''
    st.session_state.color=''
    st.session_state.pas=''


st.title("My First Application")
st.subheader("Welcome to the page", divider="rainbow")
col1, col2, col3 = st.columns(3)
with col2:
    st.image("https://www.latentview.com/wp-content/uploads/2023/09/latentview-logo.png",caption="LV Logo")

st.snow()

col1, col2 = st.columns(2)

with col1:
    name = st.text_input(label="Enter your name",key="name")
with col2:
    password = st.text_input(label="Enter password",key="pas",type="password")

color = st.selectbox(label="Choose Your Color",options=['','Pink','Blue','Green','Red','Black'],key='color')

submit = st.button("Submit")

if submit:
    st.subheader(f'My name is {name}. I like {color} color.')

clear = st.button("Clear",on_click=clear)