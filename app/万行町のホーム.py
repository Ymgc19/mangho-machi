import streamlit as st
import pandas as pd
from PIL import Image
import matplotlib.pyplot as plt
import japanize_matplotlib
import base64
from datetime import datetime, timedelta
import plotly.express as px
import plotly.graph_objects as go

# フルスクリーン
st.set_option('deprecation.showPyplotGlobalUse', False)
st.set_page_config(
    page_title="七尾市万行町のホームページ",
    layout="wide", 
#    initial_sidebar_state="auto",
    page_icon=":paintbrush:"
)

# カラーの設定
#custom_colors = ["#74ffd4", "#566382", "#709ac4", "mediumpurple", "#a1cbf7", "#d5feff",
#                 "#ffffff", "#92b7c0", "#c3e9f3", "#546463", "#d7ff86"]

custom_colors =["#da53cb", "#ff70ae", "#ffb2bc", "#fffaf7", "#ffffff",
                "#d9fffb", "#a7d6ff", "#73a1e6", "#4869b3", "#3a3a82"]



#custom_colors = ["blue", "aquamarine", "mediumpurple", "yellow", "orange", "red",
#                 "limegreen", "hotpink", "white", "greenyellow", "deeppink", "cyan"]
wedgeprops = {'linewidth': .5, 'edgecolor': 'silver'}

# pdfダウンロード用
def download_pdf(a):
    with open(a, "rb") as file:
        pdf_data = file.read()
        base64_pdf = base64.b64encode(pdf_data).decode("utf-8")
        href = f'<a href="data:application/pdf;base64,{base64_pdf}" download="kawaii_frog.pdf">Download PDF</a>'
        st.markdown(href, unsafe_allow_html=True)

# トップ画像を出す
image = Image.open("mangho-machi/photos/五反田.png")
st.image(image)


st.markdown("### ここで回覧板などを共有します")