cd mongodb\data
IF EXIST "games.bson" (
  echo games.bson exists
) ELSE (
  curl -o games.bson https://big.csr.unibo.it/projects/nosql-datasets/games.bson
)

IF EXIST "restaurants.bson" (
  echo restaurants.bson exists
) ELSE (
  curl -o restaurants.bson https://big.csr.unibo.it/projects/nosql-datasets/restaurants.bson
)

IF EXIST "yelp-business.bson" (
  echo yelp-business.bson exists
) ELSE (
  curl -o yelp-business.bson https://big.csr.unibo.it/projects/nosql-datasets/yelp-business.bson
)

cd ..\..\mysql\data
IF EXIST "foodmart.sql" (
  echo foodmart.sql exists
) ELSE (
  curl -o foodmart.sql https://big.csr.unibo.it/projects/nosql-datasets/foodmart.sql
)
cd ..\..
