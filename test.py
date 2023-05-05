import preprocess

with open("test.moth","r") as f:
    raw = f.read()

raw = preprocess.remove_comments(raw)
raw = preprocess.convert(raw)

finder = preprocess.finder([raw])
