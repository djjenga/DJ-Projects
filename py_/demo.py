from sklearn import tree

X = [181,80,44], [177,70,43], [160,60,38], [154,54,37], [166,65,40]
Y = ['male', 'female', 'female', 'female', 'male']

clf = tree.DecisionTreeClassifier()

clf = clf.fit(X,Y)

prediction = clf.predict([190,70,43])

print prediction 