import streamlit as st
import pandas as pd
from PIL import Image
import matplotlib.pyplot as plt

st.title("地区ごとの伝達事項")

df = pd.read_csv("伝達事項を入力するフォルダ/伝達事項.csv")

st.dataframe(df, use_container_width=True)