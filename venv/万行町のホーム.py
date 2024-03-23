import streamlit as st
import pandas as pd
from PIL import Image
import matplotlib.pyplot as plt


# フルスクリーン
st.set_option('deprecation.showPyplotGlobalUse', False)
st.set_page_config(
    page_title="七尾市万行町のホームページ",
    layout="wide", 
#    initial_sidebar_state="auto",
    page_icon=":paintbrush:"
)

custom_colors =["#da53cb", "#ff70ae", "#ffb2bc", "#fffaf7", "#ffffff",
                "#d9fffb", "#a7d6ff", "#73a1e6", "#4869b3", "#3a3a82"]



# トップ画像を出す
st.image(Image.open("photos/万行神社.png"))

st.title("七尾市万行町のホームページ")
st.markdown("### ここで回覧板やイベント情報を共有します")

col1, col2 = st.columns(2)
with col1:
    st.markdown("## 最近の情報")
    st.text("2024年3月23日 ホームページを開設しました")

with col2:
    st.markdown("## 回覧板")
    st.text("今後追加します")


st.image(Image.open("photos/五反田.png"))
st.text("連絡先: xxx@yyy.zzz")