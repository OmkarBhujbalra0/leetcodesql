import pandas as pd

# 1.Big Countries

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    world = world[(world['area'] >= 3000000) | (world['population']>= 25000000)]
    return world[['name','population','area']]

# 2. Recyclable and Low Fat Products

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    products = products[(products['low_fats'] == 'Y') & (products['recyclable'] == 'Y')]
    return products[['product_id']]

#16. Fix the names in the table

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    def lowerc(name):
        name = name.lower()
        name = name[0].upper() + name[1:]
        return name
    users['name'] = users['name'].apply(lowerc)
    return users[['user_id','name']].sort_values(by='user_id',ascending=True)