This article explains the language `jetbrains.mps.baselanguage.doubleDispatch`. The example comes from [this article](https://www.codeproject.com/Articles/588882/TheplusVisitorplusPatternplusExplained#single-dispatch):

Most OOP programming languages support single dispatch, more commonly known as virtual methods. For example, consider the following code:


``` java title="Single dispatch"

public class SpaceShip {
    public string GetShipType() {
        return "SpaceShip";
    }
}

public class ApolloSpacecraft extends SpaceShip {
    public string GetShipType() {
        return "ApolloSpacecraft";
    }
}

SpaceShip ship = new ApolloSpacecraft();
System.out.println(ship.GetShipType()); // output: (1)
```

1. ApolloSpacecraft

The actual method implementation which should be called, is chosen at runtime based solely on the actual type of ship. So, only the type of single object is used to select the method, hence the name single dispatch.

Note: *Single dispatch* is one form of *dynamic dispatch*, for example, the method is chosen at runtime. If the method is chosen at compile time (true for all non-virtual methods), it’s called *static dispatch*.

Now add some asteroids:

``` java title="Double dispatch"

public class Asteroid {
    public void collideWith(SpaceShip s) {
    System.out.println("Asteroid hit a SpaceShip");
    }
    
    public void collideWith(ApolloSpacecraft a) {
    System.out.println("Asteroid hit an ApolloSpacecraft");
    }
}

public class ExplodingAsteroid extends Asteroid {
    public void collideWith(SpaceShip s) {
    System.out.println("ExplodingAsteroid hit a SpaceShip");
}

public void collideWith(ApolloSpacecraft a) {
    System.out.println("ExplodingAsteroid hit an ApolloSpacecraft");
    }
}

public class DoubleDispatch {

    public static void main(string[] args) {
    Asteroid theAsteroid = new Asteroid();
    SpaceShip theSpaceShip = new SpaceShip();
    ApolloSpacecraft theApolloSpacecraft = new ApolloSpacecraft();
    
    theAsteroid.collideWith(theSpaceShip); // output: (1) 
    theAsteroid.collideWith(theApolloSpacecraft); // output: (2)
     
    System.out.println(); 
     
    ExplodingAsteroid theExplodingAsteroid = new ExplodingAsteroid(); 
    theExplodingAsteroid.collideWith(theSpaceShip); // output: (3)

    theExplodingAsteroid.collideWith(theApolloSpacecraft); // output: (4)
     
    System.out.println(); 
     
    Asteroid theAsteroidReference = theExplodingAsteroid; 
    theAsteroidReference.collideWith(theSpaceShip); // output: (5)
    theAsteroidReference.collideWith(theApolloSpacecraft); // output: (6)
     
    System.out.println(); 
     
    // Note the different datatypes  
    SpaceShip theSpaceShipReference = theApolloSpacecraft; 
    theAsteroid.collideWith(theSpaceShipReference); // output: (7)
    theAsteroidReference.collideWith(theSpaceShipReference); // output: (8)
    }
}
```

1. Asteroid hit a SpaceShip
2. Asteroid hit an ApolloSpacecraft
3. Exploding Asteroid hit a SpaceShip
4. Exploding Asteroid hit anApolloSpacecraft
5. Exploding Asteroid hit a SpaceShip
6. Exploding Asteroid hit an ApolloSpacecraft
7. Asteroid hit an ApolloSpacecraft
8. ExplodingAsteroid hit a SpaceShip

The desired result here would be *ExplodingAsteroid hit an ApolloSpacecraft* but instead you get *ExplodingAsteroid hit a SpaceShip*.
To support double dispatch, import the dispatch-language and include dispatch-modifiers in ExplodingAsteroid:

``` java
public class ExplodingAsteroid extends Asteroid {
    public dispatch void collideWith(SpaceShip s) {
    System.out.println("ExplodingAsteroid hit a SpaceShip");
    }
    
    public dispatch void collideWith(ApolloSpacecraft a) {
    System.out.println("ExplodingAsteroid hit an ApolloSpacecrat");
    }
}
```

The last method now correctly returns *ExplodingAsteroid hit an ApolloSpacecraft*.